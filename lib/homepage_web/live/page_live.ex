defmodule HomepageWeb.PageLive do
  use HomepageWeb, :live_view

  def render(assigns) do
    ~H"""
    <Layouts.flash_group flash={@flash} />
    <div class="container">
      <div class="title-bar">
        <div class="title-bar-text">
          <span>{@data.profile.title}</span>
        </div>
      </div>
      <div class="window-content">
        <div class="ascii-art">{@data.profile.ascii_art}</div>

        <div class="tagline">
          <span class="blink">►</span>
          {@data.profile.tagline}
          <span class="blink">◄</span>
          <br />
          <span class="blink">►</span>
          {@data.profile.secondary_tagline}<span class="blink">◄</span>
        </div>

        <div class="marquee-container">
          <div class="marquee">
            {@data.profile.marquee_text}
          </div>
        </div>

        <div class="nav">
          <%= for {page_name, _page_data} <- @data.pages do %>
            <% display_name = Atom.to_string(page_name) %>
            <a
              phx-click="select-page"
              phx-value-page={page_name}
              class={if @selected == page_name, do: "active"}
            >
              {"[ #{String.capitalize(display_name)} ]"}
            </a>
          <% end %>
        </div>

        <%= if @page != nil do %>
          <% {page_atom, page_content} = @page %>
          
    <!-- About Page -->
          <div :if={page_atom == :about} class="content about-content">
            <div class="about-header">
              <img
                src="https://www.gravatar.com/avatar/14a21f492187a842c7a6ba017073b7c11e193869f1273692f8d3ab7c24ab0306?s=300"
                alt="Profile Picture"
                class="profile-image"
              />
              <div class="about-summary">
                <h2>About Me</h2>
                <p>{page_content.summary}</p>
              </div>
            </div>

            <div class="section">
              <h3>🎓 Education</h3>
              <%= for edu <- page_content.education do %>
                <div class="card">
                  <div class="card-header">{edu.degree}</div>
                  <div class="card-body">
                    <p><strong>{edu.institution}</strong></p>
                    <p>{edu.location}</p>
                    <p class="dates">{edu.dates}</p>
                    <%= if Map.has_key?(edu, :gpa) do %>
                      <p class="highlight">GPA: {edu.gpa}</p>
                    <% end %>
                  </div>
                </div>
              <% end %>
            </div>

            <div class="section">
              <h3>💼 Experience</h3>
              <%= for exp <- page_content.experience do %>
                <div class="card">
                  <div class="card-header">{exp.position}</div>
                  <div class="card-body">
                    <p><strong>{exp.company}</strong></p>
                    <p>{exp.location}</p>
                    <p class="dates">{exp.dates}</p>
                  </div>
                </div>
              <% end %>
            </div>
          </div>
          
    <!-- Projects Page -->
          <div :if={page_atom == :projects} class="content projects-content">
            <h2>Projects</h2>
            <%= for project <- page_content.projects_list do %>
              <div class="project-card">
                <div class="project-header">
                  <h3>{project.name}</h3>
                  <div class="project-links">
                    <%= if Map.has_key?(project, :git_link) do %>
                      <a href={project.git_link} target="_blank" class="project-link git-link">
                        <span class="link-icon">⌨</span> Code
                      </a>
                    <% end %>
                    <%= if Map.has_key?(project, :live_link) do %>
                      <a href={project.live_link} target="_blank" class="project-link live-link">
                        <span class="link-icon">◉</span> Live
                      </a>
                    <% end %>
                  </div>
                </div>
                <p class="project-description">{raw(project.description)}</p>
                <div class="tech-tags">
                  <%= for tech <- project.technologies do %>
                    <span class="tech-tag">{tech}</span>
                  <% end %>
                </div>
              </div>
            <% end %>
          </div>
          
    <!-- Contact & Links Pages (existing functionality) -->
          <div
            :if={Map.has_key?(page_content, :links) && page_atom in [:contact, :links]}
            class="content"
          >
            <h2>{String.capitalize(Atom.to_string(page_atom))}</h2>
            <ul class="links">
              <%= for {link_name, link_url} <- page_content.links do %>
                <li><a href={link_url} target="_blank">{link_name}</a></li>
              <% end %>
            </ul>
          </div>
          
    <!-- Home Page (can be customized) -->
          <div :if={page_atom == :home} class="content home-content">
            <div class="welcome-message">
              <p>
                Welcome to my personal homepage! Navigate through the menu to explore my work, experience, and get in touch.
              </p>
            </div>
          </div>
        <% end %>

        <div class="counter">
          <div class="counter-label">
            {if @showing_current, do: "👁️ YOU ARE VISITOR NUMBER:", else: "👁️ TOTAL VISITORS:"}
          </div>
          <div class="counter-number">
            {String.pad_leading(Integer.to_string(@display_number), 5, "0")}
          </div>
        </div>
      </div>
      <div class="status-bar">
        <span>{@data.footer.status}</span>
        <span>Last Updated: {@data.footer.last_updated}</span>
      </div>
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

    {:noreply, socket} = handle_event("select-page", %{"page" => "home"}, socket)

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
