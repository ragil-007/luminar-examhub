function loadStudentsByExam(selectedStudentId = null) {
    const examId = document.getElementById("examSelect").value;
    const studentSelect = document.getElementById("studentSelect");

    if (!examId) {
        studentSelect.innerHTML =
            "<option value=''>-- Select Student --</option>";
        return;
    }

    let url = "getStudentsByExam.jsp?examId=" + examId;

    // edit page
    if (selectedStudentId) {
        url =
          "getStudentsByExamForEdit.jsp" +
          "?examId=" + examId +
          "&currentStudentId=" + selectedStudentId;
    }

    const xhr = new XMLHttpRequest();
    xhr.open("GET", url, true);

    xhr.onload = function () {
        if (xhr.status === 200) {
            studentSelect.innerHTML = xhr.responseText;

            if (selectedStudentId) {
                studentSelect.value = selectedStudentId;
            }
        }
    };

    xhr.send();
}

