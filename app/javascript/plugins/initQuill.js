window.addEventListener("DOMContentLoaded", e => {
  if (document.querySelector("#editor")) {
    const tooltipOptions = [
      ["bold", "italic", "underline", "strike"], // toggled buttons
      ["blockquote", "code-block"],
      [{ header: [1, 2, 3, 4, 5, 6, false] }],

      // [{ 'header': 1 }, { 'header': 2 }],               // custom button values
      [{ list: "ordered" }, { list: "bullet" }],
      // [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
      // [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
      // [{ 'direction': 'rtl' }],                         // text direction

      [{ size: ["small", false, "large", "huge"] }], // custom dropdown

      [{ color: [] }, { background: [] }], // dropdown with defaults from theme
      // [{ 'font': [] }],
      // [{ 'align': [] }],

      // ['clean'],                                       // remove formatting button

      ["link", "image", "video"] // link and image, video
    ];

    const loadForm = () => {
      const body = document.querySelector(".body");
      const editor = document.querySelector(".ql-editor");
      editor.innerHTML = body.value;
    };
    // APPELE EN PREMIER
    const submitForm = () => {
      const editor = document.querySelector(".ql-editor");
      const body = document.querySelector(".body");
      body.value = editor.innerHTML;
    };

    document.querySelectorAll(".fake-submit").forEach(submit => {
      submit.addEventListener("click", submitForm);
    });

    var quill = new Quill("#editor", {
      theme: "snow",
      modules: {
        toolbar: tooltipOptions
        // imageResize: {
        //   displaySize: true
        // }
      },
      placeholder: "Rédiger un article"
    });

    loadForm();
  }
});
