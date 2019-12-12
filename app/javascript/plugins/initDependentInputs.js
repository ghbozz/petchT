import $ from 'jquery';

const initDependentInputs = () => {
  $('.animal-select').change(function () {
      var id = this.value;
      var selection = this.options[id].text
      $.ajax({
        url: "/animal_select?animal=" + selection,
        type: "GET"
      })
  });
}

export { initDependentInputs }
