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
        
    <!-- <h1>CĂTĂLIN PLEȘU</h1> -->

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
            <a phx-click="select-page" phx-value-page={page_name}>
              {"[ #{String.capitalize(display_name)} ]"}
            </a>
          <% end %>
        </div>

        <%= if @page != nil do %>
          <% {page_atom, page_content} = @page %>
          <div :if={Map.has_key?(page_content, :links)} class="content">
            <ul class="links">
              <%= for {link_name, link_url} <- page_content.links do %>
                <li><a href={link_url}>{link_name}</a></li>
              <% end %>
            </ul>
          </div>
        <% end %>

        <div class="counter">
          <div>👁️ YOU ARE VISITOR NUMBER:</div>
          <div class="counter-number">000042</div>
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
    data = Homepage.Data.get()
    [head | _] = data.pages
    {atom, _} = head

    socket =
      socket
      |> assign(:data, data)
      |> assign(:selected, atom)
      |> assign(:page, nil)

    {:ok, socket}
  end

  def handle_event("select-page", %{"page" => page}, socket) do
    page =
      Enum.find(socket.assigns.data.pages, fn {page_name, _} ->
        Atom.to_string(page_name) == page
      end)
    dbg(page)
    socket =
      socket
      |> assign(:page, page)

    {:noreply, socket}
  end
end
