document.addEventListener('DOMContentLoaded', function () {

    /* ========= SIDEBAR ========= */
    var menuBtn = document.getElementById('menuBtn');
    var sidebar = document.querySelector('.sidebar');
    var scrim = document.querySelector('.scrim');

    function toggleMenu() {
        sidebar.classList.toggle('active');
        scrim.classList.toggle('active');
    }

    if (menuBtn) menuBtn.addEventListener('click', toggleMenu);
    if (scrim) scrim.addEventListener('click', toggleMenu);

    /* ========= ATTENDANCE CHART ========= */
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
                    borderColor: '#0061a4',
                    backgroundColor: 'rgba(0,97,164,0.15)',
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
        document.getElementById('attendanceAvg').innerText = avg + "%";
    }

    /* ========= PERFORMANCE CHART ========= */
    // Updated to use performanceData
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
                    backgroundColor: '#80f0e0',
                    borderRadius: 8,
                    barThickness: 22
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

/* ========= MODALS ========= */
function openModal(id) {
    var m = document.getElementById(id);
    if (m) m.classList.add('open');
}

function closeModal(id) {
    var m = document.getElementById(id);
    if (m) m.classList.remove('open');
}

function showNotice(title, date, content) {
    document.getElementById('noticeTitle').innerText = title;
    document.getElementById('noticeDate').innerText = date;
    document.getElementById('noticeContent').innerText = content;
    openModal('noticeModal');
}