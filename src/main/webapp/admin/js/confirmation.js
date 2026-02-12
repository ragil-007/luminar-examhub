
function confirmDeptDelete(deptId) {
   const isConfirmed = confirm("Confirm deletion");

   if (isConfirmed) {
     window.location.href =
       "deleteDepartment.jsp?deptId=" + deptId;
    }
    // else → do nothing
}

function confirmCourseDelete(courseId) {
   const isConfirmed = confirm("Confirm deletion");

   if (isConfirmed) {
     window.location.href =
       "deleteCourse.jsp?courseId=" + courseId;
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
