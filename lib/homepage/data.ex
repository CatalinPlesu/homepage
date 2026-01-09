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
        title: "Cătălin Pleșu - Homepage"
      },
      pages: [
        about: %{
          summary:
            "Backend developer working with C# with interest in Elixir and Phoenix. Focused on shipping products, data analysis, and finding information.",
          education:
            {[
               %{
                 institution: "Technical University of Moldova",
                 degree: "Master's Degree in Information Technology",
                 location: "Chișinău, Moldova",
                 dates: "2024 - Jan 2026"
               },
               %{
                 institution: "Technical University of Moldova",
                 degree: "Bachelor's Degree in Information Technology",
                 location: "Chișinău, Moldova",
                 dates: "2020 - 2024"
               }
             ], "fa-solid fa-building-columns"},
          experience:
            {[
               %{
                 company: "Jivy Group",
                 position: "C# Backend Developer",
                 location: "Chișinău, Moldova",
                 dates: "Nov 2025 - Jan 2026"
               },
               %{
                 company: "AROBS Software",
                 position: "Junior Embedded Software Engineer",
                 location: "Chișinău, Moldova",
                 dates: "2023 - 2024"
               }
             ], "fa-solid fa-briefcase"}
        },
        contact: %{
          links: [
            {"Telegram", "https://t.me/catalinplesu", "fa-brands fa-telegram"},
            {"Email", "mailto:catalin.plesu@proton.me", "fa-solid fa-envelope"}
          ]
        },
        projects: %{
          projects_list: [
            %{
              name: "ErgoType",
              description:
                "An intelligent keyboard layout optimization tool using genetic algorithms to create personalized layouts based on your typing patterns. Analyzes your text data to minimize finger travel distance and maximize typing comfort.",
              git_link: "https://github.com/CatalinPlesu/ErgoType.2",
              technologies: ["Python", "Genetic Algorithms", "Data Analysis"],
              status: "In Progress"
            },
            %{
              name: "CV Builder",
              description:
                "A modern CV/resume builder with real-time preview and multiple export formats. Built with Ruby on Rails and deployed on Render.",
              git_link: "https://github.com/CatalinPlesu/cv_builder",
              live_link: "https://cv-builder.catalinplesu.xyz",
              technologies: ["Ruby", "Rails", "PostgreSQL", "Render"]
            },
            %{
              name: "Moldova Job Market Analysis",
              description:
                "An autonomous system that collects, processes, and analyzes job market data from Moldova. Features automated web scraping, data pipeline, analytics, and generates a GitHub Pages site with insights and visualizations.",
              git_link: "https://github.com/CatalinPlesu/job-market",
              technologies: ["Python", "Web Scraping", "Data Analysis", "GitHub Actions"],
              status: "In Progress"
            },
            %{
              name: "Homepage",
              description:
                "This personal website built with Elixir and Phoenix LiveView. Features a terminal-inspired UI with dynamic content rendering and minimal JavaScript.",
              git_link: "https://github.com/CatalinPlesu/homepage",
              live_link: "https://catalinplesu.xyz/",
              technologies: ["Elixir", "Phoenix", "LiveView"]
            },
            %{
              name: "Franken Pad",
              description:
                "Custom DIY macropad featuring 5 mechanical switches, 3 rotary encoders, and 3 toggle switches. Programmable with QMK firmware for custom macros and productivity workflows.",
              git_link: "https://github.com/CatalinPlesu/franken_pad",
              technologies: ["C", "QMK", "Hardware", "Embedded"]
            },
            %{
              name: "Demo",
              description:
                "Subdomain to which i might choose to expose the thing i am working currently using <b>ssh -R</b>",
              live_link: "https://dev.catalinplesu.xyz/",
              technologies: ["ssh", "Caddy"]
            }
          ]
        },
        links: %{
          links: [
            {"Github", "https://github.com/CatalinPlesu", "fa-brands fa-github"},
            {"Telegram", "https://t.me/catalinplesu", "fa-brands fa-telegram"},
            {"YouTube", "https://www.youtube.com/channel/UC752pTuCebS37pCYwYPirow",
             "fa-brands fa-youtube"},
            {"Email", "mailto:catalin.plesu@proton.me", "fa-solid fa-envelope"}
          ]
        }
      ],
      footer: %{
        status: ~s[<i class="fa-solid fa-bolt"></i> System Ready],
        last_updated: "01/01/2026"
      }
    }
  end
end
