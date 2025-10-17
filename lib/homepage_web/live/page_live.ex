defmodule HomepageWeb.PageLive do
  use HomepageWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.flash_group flash={@flash} />

    <div class="min-h-screen w-full flex items-center justify-center p-4">
      <main class="card bg-base-100 shadow-2xl border border-base-300 p-6 w-full max-w-4xl">
        <header class="mb-4">
          <h1 class="text-2xl font-bold text-center">{@data.profile.title}</h1>
        </header>

        <section id="content-window">
          <nav class="mb-6">
            <ul class="flex flex-wrap justify-center gap-2">
              <%= for {page_name, _page_data} <- @data.pages do %>
                <% display_name = Atom.to_string(page_name) %>
                <li>
                  <a
                    phx-click="select-page"
                    phx-value-page={page_name}
                    class={if @selected == page_name, do: "btn btn-primary", else: "btn btn-ghost"}
                  >
                    {String.capitalize(display_name)}
                  </a>
                </li>
              <% end %>
            </ul>
          </nav>

          <article id="page-content" class="mb-6">
            <%= if @page != nil do %>
              <% {page_atom, page_content} = @page %>

              <section :if={page_atom == :about}>
                <div id="about-header" class="flex flex-col md:flex-row gap-4 items-center mb-6">
                  <img
                    src="https://www.gravatar.com/avatar/14a21f492187a842c7a6ba017073b7c11e193869f1273692f8d3ab7c24ab0306?s=300"
                    alt="Profile Picture"
                    class="rounded-lg w-24 h-24 object-cover"
                  />
                  <div id="about-summary">
                    <h2 class="text-xl font-semibold mb-2">About Me</h2>
                    <p>{page_content.summary}</p>
                  </div>
                </div>

                <section class="mb-6">
                  <% {education, icon} = page_content.education %>
                  <h3 class="text-lg font-semibold mb-3 flex items-center gap-2">
                    <i class={icon}></i> Education
                  </h3>
                  <%= for edu <- education do %>
                    <div class="card bg-base-200 shadow-md p-4 mb-3">
                      <h4 class="font-medium">{edu.degree}</h4>
                      <p class="font-semibold">{edu.institution}</p>
                      <p class="text-sm opacity-80">{edu.location}</p>
                      <time class="text-sm">{edu.dates}</time>
                      <%= if Map.has_key?(edu, :gpa) do %>
                        <p class="text-sm">GPA: {edu.gpa}</p>
                      <% end %>
                    </div>
                  <% end %>
                </section>

                <section>
                  <% {experience, icon} = page_content.experience %>
                  <h3 class="text-lg font-semibold mb-3 flex items-center gap-2">
                    <i class={icon}></i> Experience
                  </h3>
                  <%= for exp <- experience do %>
                    <div class="card bg-base-200 shadow-md p-4 mb-3">
                      <h4 class="font-medium">{exp.position}</h4>
                      <p class="font-semibold">{exp.company}</p>
                      <p class="text-sm opacity-80">{exp.location}</p>
                      <time class="text-sm">{exp.dates}</time>
                    </div>
                  <% end %>
                </section>
              </section>

              <section :if={page_atom == :projects}>
                <h2 class="text-xl font-semibold mb-4">Projects</h2>
                <%= for project <- page_content.projects_list do %>
                  <div class="card bg-base-200 shadow-md p-4 mb-4">
                    <header class="flex justify-between items-start mb-2">
                      <h3 class="text-lg font-semibold">{project.name}</h3>
                      <div class="project-links flex gap-2">
                        <%= if Map.has_key?(project, :git_link) do %>
                          <a
                            href={project.git_link}
                            target="_blank"
                            class="btn btn-xs btn-info btn-outline"
                          >
                            <i class="fa-solid fa-code"></i> Code
                          </a>
                        <% end %>
                        <%= if Map.has_key?(project, :live_link) do %>
                          <a
                            href={project.live_link}
                            target="_blank"
                            class="btn btn-xs btn-error"
                          >
                            <i class="fa-regular fa-circle-dot"></i> Live
                          </a>
                        <% end %>
                      </div>
                    </header>
                    <p class="mb-2">{raw(project.description)}</p>
                    <footer class="flex flex-wrap gap-1">
                      <%= for tech <- project.technologies do %>
                        <span class="badge badge-ghost text-xs">{tech}</span>
                      <% end %>
                    </footer>
                  </div>
                <% end %>
              </section>

              <section :if={Map.has_key?(page_content, :links) && page_atom in [:contact, :links]}>
                <h2 class="text-xl font-semibold mb-4">
                  {String.capitalize(Atom.to_string(page_atom))}
                </h2>
                <!-- Single column list with spacing and background variation -->
                <div class="space-y-2">
                  <!-- Container with vertical spacing -->
                  <%= for {link_name, link_url, icon} <- page_content.links do %>
                    <!-- Each link item with its own background and padding -->
                    <a
                      href={link_url}
                      target="_blank"
                      class="flex items-center gap-2 p-3 rounded-lg bg-base-200 hover:bg-base-300 transition-colors duration-200"
                    >
                      <i class={icon}></i>
                      <span>{link_name}</span>
                    </a>
                  <% end %>
                </div>
              </section>
            <% end %>
          </article>

          <aside id="counter" class="text-center">
            <p class="mb-1">
              <%= if @showing_current do %>
                <i class="fa-solid fa-eye"></i> YOU ARE VISITOR NUMBER:
              <% else %>
                <i class="fa-solid fa-eye"></i> TOTAL VISITORS:
              <% end %>
            </p>
            <p id="counter-number" class="text-2xl font-mono font-bold">
              {String.pad_leading(Integer.to_string(@display_number), 5, "0")}
            </p>
          </aside>
        </section>

        <footer class="mt-6 pt-4 border-t border-base-300 text-center text-sm">
          <span>{raw(@data.footer.status)}</span>
          <time class="block mt-1">Last Updated: {@data.footer.last_updated}</time>
        </footer>
      </main>
    </div>
    """
  end

  def mount(_params, session, socket) do
    guest_id = session["guest_id"]
    guest_number = Homepage.Guests.get_guest_number!(guest_id)
    total_visitors = Homepage.Guests.get_total_guests()

    data = Homepage.Data.get()
    [head | _] = data.pages
    {atom, _} = head

    socket =
      socket
      |> assign(:data, data)
      |> assign(:selected, atom)
      |> assign(:page, nil)
      |> assign(:guest_number, guest_number)
      |> assign(:total_visitors, total_visitors)
      |> assign(:showing_current, true)
      |> assign(:display_number, guest_number)
      |> assign(:page_title, data.profile.title)

    {:noreply, socket} = handle_event("select-page", %{"page" => "about"}, socket)

    # Start the timer to swap numbers
    Process.send_after(self(), :swap_visitor_number, 3000)

    {:ok, socket}
  end

  def handle_event("select-page", %{"page" => page}, socket) do
    page_atom = String.to_existing_atom(page)

    page =
      Enum.find(socket.assigns.data.pages, fn {page_name, _} ->
        page_name == page_atom
      end)

    socket =
      socket
      |> assign(:page, page)
      |> assign(:selected, page_atom)

    {:noreply, socket}
  end

  def handle_info(:swap_visitor_number, socket) do
    showing_current = !socket.assigns.showing_current

    display_number =
      if showing_current, do: socket.assigns.guest_number, else: socket.assigns.total_visitors

    socket =
      socket
      |> assign(:showing_current, showing_current)
      |> assign(:display_number, display_number)

    # Schedule next swap
    Process.send_after(self(), :swap_visitor_number, 3000)

    {:noreply, socket}
  end
end
