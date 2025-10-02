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
        tagline: "Full-Stack Developer | Elixir & Python Enthusiast | Former Embedded Engineer",
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
        about: %{
          summary:
            "Independent developer working with Elixir and Phoenix. Currently focused on building projects in productivity and personal development.",
          education: [
            %{
              institution: "Technical University of Moldova",
              degree: "Master’s Degree in Information Technology",
              location: "Chișinău, Moldova",
              dates: "2024 - Present"
            },
            %{
              institution: "Technical University of Moldova",
              degree: "Bachelor’s Degree in Information Technology",
              location: "Chișinău, Moldova",
              dates: "2020 - 2024"
            }
          ],
          experience: [
            %{
              company: "AROBS Software",
              position: "Junior Embedded Software Engineer",
              location: "Chișinău, Moldova",
              dates: "2023 - 2024"
            }
          ]
        },
        contact: %{
          links: [
            {"Telegram", "https://t.me/catalinplesu"},
            {"Email", "mailto:catalin.plesu@proton.me"},
            {"Twitter", "https://twitter.com/catalinplesu"},
            {"LinkedIn", "https://www.linkedin.com/in/c%C4%83t%C4%83lin-ple%C8%99u-042872209/"}
          ]
        },
        projects: %{
          projects_list: [
            %{
              name: "ErgoType",
              description:
                "A tool in python that uses Genetic Algorithms to create a better keyboard layout.",
              git_link: "https://github.com/CatalinPlesu/ErgoType.2",
              technologies: ["Python", "Genetic Algorithms"]
            },
            %{
              name: "CV Builder",
              description:
                "Built a tag-driven CV Builder web application in Ruby on Rails with SQLite, following MVC architecture. Created a LaTeX-to-PDF generation pipeline. Deployed using Podman.",
              git_link: "https://github.com/CatalinPlesu/cv_builder",
              live_link: "https://cv-builder.catalinplesu.xyz/",
              technologies: ["Ruby on Rails", "MVC", "LaTeX", "PDF", "Podman", "SQLite"]
            },
            %{
              name: "Oroboros Landing Page",
              description:
                "Built a landing page and admin dashboard using Elixir/Phoenix. Used SQLite database, in-memory caching, comment moderation, and analytics collection. Deployed on a Hetzner VPS using Docker and Caddy.",
              git_link: "https://github.com/CatalinPlesu/oroboros_landing",
              live_link: "https://oroboros.app/",
              technologies: ["Elixir", "Phoenix", "SQLite", "Docker", "Caddy", "VPS"]
            },
            %{
              name: "Moldova Job Market Analysis",
              description:
                "Developed a Python-based web scraper and data pipeline to collect, structure, and analyze job postings. Used Pandas for data analysis and JSON for storage.",
              git_link: "https://github.com/CatalinPlesu/job_market_md_refactor",
              technologies: ["Python", "Web Scraping", "Data Analysis"]
            }
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
            {"LinkedIn", "https://www.linkedin.com/in/c%C4%83t%C4%83lin-ple%C8%99u-042872209/"}
          ]
        }
      ],
      footer: %{
        status: "⚡ System Ready",
        last_updated: "02/10/2025"
      }
    }
  end
end
