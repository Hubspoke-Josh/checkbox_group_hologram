defmodule CheckboxGroupHologramApp.HomePage do
  use Hologram.Page

  route "/"

  layout CheckboxGroupHologramApp.MainLayout

  def init(_params, component, _server) do
    component
    |> put_state(:selected_fruits, [])
  end

  def template do
    ~HOLO"""
    <form $submit="form_submitted">
      <div class="mb-5">
        <label>Select your favorite fruits:</label>
      <div class="flex">
          <input type="checkbox" name="fruits[]" value="apple" id="apple" />
          <label for="apple">Apple</label>
        </div>
        <div class="flex">
          <input type="checkbox" name="fruits[]" value="banana" id="banana" />
          <label for="banana">Banana</label>
        </div>
      </div>
      <button type="submit">Submit</button>
    </form>
    <p class="mt-5">
      You selected: {inspect(@selected_fruits)}
    </p>
    """
  end

  def action(:form_submitted, %{event: params}, component) do
    IO.inspect(params, label: "Form submitted with params")

    component
    |> put_state(:selected_fruits, params)
  end
end
