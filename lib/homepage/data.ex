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
            "Independent developer working with Elixir and Phoenix. Currently focused on building projects in productivity and personal development.",
          education:
            {[
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
             ], "fa-solid fa-building-columns"},
          experience:
            {[
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
            {"Email", "mailto:catalin.plesu@proton.me", "fa-solid fa-envelope"},
            {"Twitter", "https://twitter.com/catalinplesu", "fa-brands fa-twitter"},
            {"LinkedIn", "https://www.linkedin.com/in/c%C4%83t%C4%83lin-ple%C8%99u-042872209/",
             "fa-brands fa-telegram"}
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
            {"Gitlab", "https://gitlab.com/catalinplesu", "fa-brands fa-gitlab"},
            {"Telegram", "https://t.me/catalinplesu", "fa-brands fa-telegram"},
            {"Reddit", "https://www.reddit.com/user/_katarin", "fa-brands fa-reddit"},
            {"Twitter", "https://twitter.com/catalinplesu", "fa-brands fa-twitter"},
            {"YouTube", "https://www.youtube.com/channel/UC752pTuCebS37pCYwYPirow",
             "fa-brands fa-youtube"},
            {"LinkedIn", "https://www.linkedin.com/in/c%C4%83t%C4%83lin-ple%C8%99u-042872209/",
             "fa-brands fa-linkedin"}
          ]
        }
      ],
      footer: %{
        status: ~s[<i class="fa-solid fa-bolt"></i> System Ready],
        last_updated: "17/10/2025"
      }
    }
  end
end
