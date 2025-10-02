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
      pages: [
        home: %{},
        about: %{},
        contact: %{
          links: [
            {"Telegram", "https://t.me/catalinplesu"},
            {"Twitter", "https://twitter.com/catalinplesu"},
            {"Email", "mailto:catalin.plesu@proton.me"},

          ]
        },
        projects: %{
          links: [
            {"Github", "https://github.com/CatalinPlesu"},
            {"Gitlab", "https://gitlab.com/catalinplesu"},
            {"Oroboros", "https://oroboros.app"}
          ]
        },
        links: %{
          links: [
            {"Github", "https://github.com/CatalinPlesu"},
            {"Gitlab", "https://gitlab.com/catalinplesu"},
            {"Telegram", "https://t.me/catalinplesu"},
            {"Reddit", "https://www.reddit.com/user/_katarin"},
            {"Twitter", "https://twitter.com/catalinplesu"},
            {"YouTube", "https://www.youtube.com/channel/UC752pTuCebS37pCYwYPirow"},
            {"LinkedIn", "https://www.linkedin.com/in/c%C4%83t%C4%83lin-ple%C8%99u-042872209/"},
            {"Resume", "/static/Catalin_Plesu_Resume.pdf"},
            {"Oroboros", "https://oroboros.app"}
          ]
        }
      ],
      footer: %{
        status: "⚡ System Ready",
        last_updated: "29/09/2025"
      }
    }
  end
end
