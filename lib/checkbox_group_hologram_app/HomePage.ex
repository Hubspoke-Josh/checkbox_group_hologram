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
        <label>Single Option:</label>
        <div class="flex gap-2">
          <input type="checkbox" name="vegetable[]" value="spinach" id="spinach" />
          <label for="spinach">Spinach</label>
        </div>
      </div>

      <div class="mb-5">
        <label>Multiple Options:</label>
        <div class="flex gap-2">
          <input type="checkbox" name="fruits[]" value="apple" id="apple" />
          <label for="apple">Apple</label>
        </div>
        <div class="flex gap-2">
          <input type="checkbox" name="fruits[]" value="banana" id="banana" />
          <label for="banana">Banana</label>
        </div>
      </div>

      <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
    </form>
    <p class="mt-5">
      You selected: {inspect(@selected_fruits)}
    </p>
    """
  end

  def action(:form_submitted, %{event: params}, component) do
    # ~JS"""
    # let allFruits = document.querySelectorAll('input[name="fruits[]"]');
    # let fruits = Array.from(allFruits).filter(checkbox => checkbox.checked).map(checkbox => checkbox.value);

    # console.log("Selected fruits:", fruits);
    # """

    IO.inspect(params, label: "Form submitted with params")

    component
    |> put_state(:selected_fruits, params)
  end
end
