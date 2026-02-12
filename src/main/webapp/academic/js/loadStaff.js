function loadStaff(selectedStaffId = null) {
    const combined = document.getElementById("examModeDept").value;
    if (!combined) return;

    const deptId = combined.split("-")[1];

    const xhr = new XMLHttpRequest();
    xhr.open("GET", "getStaffByDepartment.jsp?deptId=" + deptId, true);

    xhr.onload = function () {
        if (xhr.status === 200) {
            const staffSelect = document.getElementById("allocatedTo");
            staffSelect.innerHTML = xhr.responseText;

            //EDIT PAGE ONLY
            if (selectedStaffId) {
                staffSelect.value = selectedStaffId;
            }
        }
    };

    xhr.send();
}
