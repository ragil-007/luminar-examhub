
function confirmStudentDelete(stuId) {
   const isConfirmed = confirm("Confirm deletion");

   if (isConfirmed) {
     window.location.href =
       "deleteStudent.jsp?stuId=" + stuId;
    }
    // else → do nothing
}

function confirmExamDelete(examId) {
   const isConfirmed = confirm("Confirm deletion");

   if (isConfirmed) {
     window.location.href =
       "deleteExam.jsp?examId=" + examId;
    }
    // else → do nothing
}


function confirmBatchDelete(batchId) {
   const isConfirmed = confirm("Confirm deletion");

   if (isConfirmed) {
     window.location.href =
       "deleteBatch.jsp?batchId=" + batchId;
    }
    // else → do nothing
}

function confirmExamResultDelete(resultId) {
   const isConfirmed = confirm("Confirm deletion");

   if (isConfirmed) {
     window.location.href =
       "deleteExamResult.jsp?resultId=" + resultId;
    }
    // else → do nothing
}
