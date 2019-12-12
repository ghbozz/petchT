import $ from 'jquery';

const initDependentInputs = () => {
  $('.animal-select').change(function () {
      var id = this.value;
      $.ajax({
        url: "/animal_select?animal=" + id,
        type: "GET"
      })
  });
}

export { initDependentInputs }
