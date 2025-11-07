defmodule CheckboxGroupHologramApp.MainLayout do
  use Hologram.Component

  alias Hologram.UI.Runtime

  def template do
    ~HOLO"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <title>Checkbox Group Test</title>
        <Runtime />
      </head>
      <body>
        <main>
          <slot />
        </main>
      </body>
    </html>
    """
  end
end
