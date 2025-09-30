defmodule Homepage.Data do
  @moduledoc """
  Provides the static data for the new personal homepage.
  """

  @doc """
  Returns the main data map for the new homepage.
  """
  def get do
    %{
      profile: %{
        name: "Cătălin Pleșu",
        title: "Cătălin Pleșu - Homepage",
        tagline: "Elixir Enthusiast ⚡ |> Full-stack Developer |> Creating Oroboros",
        secondary_tagline: "Gruvbox ♥️",
        ascii_art: """
        ╔═══════════════════════════════════════════════════════════════════╗
        ║  ▄████▄   ▄▄▄     ▄▄▄█████▓ ▄▄▄       ██▓     ██▓ ███▄    █      ║
        ║ ▒██▀ ▀█  ▒████▄   ▓  ██▒ ▓▒▒████▄    ▓██▒    ▓██▒ ██ ▀█   █      ║
        ║ ▒▓█    ▄ ▒██  ▀█▄ ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░    ▒██▒▓██  ▀█ ██▒     ║
        ║ ▒▓▓▄ ▄██▒░██▄▄▄▄██░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░    ░██░▓██▒  ▐▌██▒     ║
        ║ ▒ ▓███▀ ░ ▓█   ▓██▒ ▒██▒ ░  ▓█   ▓██▒░██████▒░██░▒██░   ▓██░     ║
        ║ ░ ░▒ ▒  ░ ▒▒   ▓▒█░ ▒ ░░    ▒▒   ▓▒█░░ ▒░▓  ░░▓  ░ ▒░   ▒ ▒      ║
        ╚═══════════════════════════════════════════════════════════════════╝
        """,
        marquee_text: "CĂTĂLIN PLEȘU"
      },
      navigation: %{
        left: ["HOME"],
        # Added PROJECTS based on the HTML
        right: ["CONTACT", "ABOUT", "PROJECTS"]
      },
      links: %{
        "Github" => "https://github.com/CatalinPlesu",
        "Gitlab" => "https://gitlab.com/catalinplesu",
        "Telegram" => "https://t.me/catalinplesu",
        "Reddit" => "https://www.reddit.com/user/_katarin",
        "Twitter" => "https://twitter.com/catalinplesu",
        "YouTube" => "https://www.youtube.com/channel/UC752pTuCebS37pCYwYPirow",
        "LinkedIn" => "https://www.linkedin.com/in/c%C4%83t%C4%83lin-ple%C8%99u-042872209/",
        # Assuming it's served from /static
        "Resume" => "/static/Catalin_Plesu_Resume.pdf",
        "Oroboros" => "https://oroboros.app"
      },
      # You could add specific content for each page section if needed
      pages: %{
        home:
          %{
            # Content specific to the home page if it differs from profile
          },
        contact: %{
          # Content for the contact page (likely links like Telegram, Email if available)
          # Example
          contact_links: ["Telegram", "Email"]
        },
        about: %{
          # Content for the about page (could be detailed bio, links to LinkedIn, Resume, etc.)
          description: "Pseudo Human, under continuous development.",
          details: "..."
        },
        projects: %{
          # Content for the projects page (could link to GitHub, GitLab, Oroboros, etc.)
          project_links: ["Github", "Gitlab", "Oroboros"]
        }
      },
      footer: %{
        status: "⚡ System Ready",
        last_updated: "29/09/2025"
      }
    }
  end
end
