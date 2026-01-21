document.addEventListener('DOMContentLoaded', function () {

    /* ========= SIDEBAR (Handled by inline JSP script now, but kept for backup) ========= */
    var menuBtn = document.getElementById('menuBtn');
    var sidebar = document.querySelector('.sidebar');
    var scrim = document.querySelector('.scrim');

    function toggleMenu() {
        if(sidebar) sidebar.classList.toggle('active');
        if(scrim) scrim.classList.toggle('active');
    }

    if (menuBtn) menuBtn.addEventListener('click', toggleMenu);
    if (scrim) scrim.addEventListener('click', toggleMenu);

    /* ========= ATTENDANCE CHART (Updated Colors) ========= */
    if (typeof attendanceData !== "undefined" &&
        Array.isArray(attendanceData) &&
        attendanceData.length > 0) {

        var attendanceCanvas = document.getElementById('attendanceChart');

        new Chart(attendanceCanvas, {
            type: 'line',
            data: {
                labels: attendanceData.map((_, i) => 'Student ' + (i + 1)),
                datasets: [{
                    data: attendanceData,
                    borderColor: '#2D7A7B', /* Patina Mid */
                    backgroundColor: 'rgba(45, 122, 123, 0.15)', /* Patina transparent */
                    fill: true,
                    tension: 0.4,
                    pointRadius: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    x: { grid: { display: false } },
                    y: { display: false }
                }
            }
        });

        var avg =
            Math.round(attendanceData.reduce((a, b) => a + b, 0) / attendanceData.length);
        if(document.getElementById('attendanceAvg')) {
            document.getElementById('attendanceAvg').innerText = avg + "%";
        }
    }

    /* ========= PERFORMANCE CHART (Updated Colors) ========= */
    if (typeof student !== "undefined" &&
        typeof performanceData !== "undefined" &&
        student.length > 0 &&
        performanceData.length > 0) {

        var perfCanvas = document.getElementById('performanceChart');

        new Chart(perfCanvas.getContext('2d'), {
            type: 'bar',
            data: {
                labels: student,
                datasets: [{
                    data: performanceData.map(Number),
                    backgroundColor: '#B45309', /* Copper Mid */
                    borderRadius: 4,
                    barThickness: 15
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: { beginAtZero: true, max: 100 },
                    x: { grid: { display: false } }
                }
            }
        });
    }

    /* ========= CHIPS ========= */
    var chips = document.querySelectorAll('.chip');
    chips.forEach(function (chip) {
        chip.addEventListener('click', function () {
            chips.forEach(c => c.classList.remove('active'));
            this.classList.add('active');
        });
    });
});

/* ========= MODALS (Synced with CSS .active) ========= */
// These are also in the JSP for safety, but good to have here
function openModal(id) {
    var m = document.getElementById(id);
    if (m) m.classList.add('active'); // Changed from 'open' to 'active'
}

function closeModal(id) {
    var m = document.getElementById(id);
    if (m) m.classList.remove('active'); // Changed from 'open' to 'active'
}

function showNotice(title, date, content) {
    // Check if elements exist before setting
    if(document.getElementById('noticeTitle')) document.getElementById('noticeTitle').innerText = title;
    if(document.getElementById('noticeDate')) document.getElementById('noticeDate').innerText = date;
    if(document.getElementById('noticeContent')) document.getElementById('noticeContent').innerText = content;
    openModal('noticeModal');
}