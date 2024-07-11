<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitud de Préstamo</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e9ecef);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 1rem;
        }
        .tab {
            padding: 0.5rem 1rem;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            border: none;
            border-radius: 5px 5px 0 0;
            margin-right: 1px;
        }
        .tab.active {
            background-color: #0056b3;
        }
        .tab-content {
            display: none;
            background: white;
            padding: 2rem;
            border-radius: 0 5px 5px 5px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            max-width: 500px;
            width: 100%;
            text-align: center;
        }
        .tab-content.active {
            display: block;
        }
        .input-group {
            margin: 1rem 0;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #495057;
        }
        input, select {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
        button {
            background: #007bff;
            color: white;
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background: #0056b3;
        }
        .progress-bar {
            margin-top: 1rem;
            background: #e9ecef;
            border-radius: 5px;
            overflow: hidden;
            position: relative;
            height: 20px;
        }
        .progress {
            background: #28a745;
            height: 100%;
            width: 0;
            transition: width 0.5s;
        }
    </style>
</head>
<body>
    <div class="tabs">
        <button class="tab active" onclick="openTab(event, 'personal')">Datos Personales</button>
        <button class="tab" onclick="openTab(event, 'monto')">Monto del Préstamo</button>
        <button class="tab" onclick="openTab(event, 'confirmacion')">Confirmación</button>
    </div>

    <div id="personal" class="tab-content active">
        <h2>Datos Personales</h2>
        <div class="input-group">
            <label for="nombre">Nombre Completo</label>
            <input type="text" id="nombre" placeholder="Ingresa tu nombre completo">
        </div>
        <div class="input-group">
            <label for="edad">Edad</label>
            <input type="number" id="edad" placeholder="Ingresa tu edad">
        </div>
        <div class="input-group">
            <label for="domicilio">Domicilio</label>
            <input type="text" id="domicilio" placeholder="Ingresa tu domicilio">
        </div>
        <div class="input-group">
            <label for="codigo_postal">Código Postal</label>
            <input type="text" id="codigo_postal" placeholder="Ingresa tu código postal">
        </div>
        <div class="input-group">
            <label for="calle">Calle</label>
            <input type="text" id="calle" placeholder="Ingresa el nombre de la calle">
        </div>
        <div class="input-group">
            <label for="numero_casa">Número de Casa</label>
            <input type="text" id="numero_casa" placeholder="Ingresa el número de casa">
        </div>
        <div class="input-group">
            <label for="numero_interno">Número Interno</label>
            <input type="text" id="numero_interno" placeholder="Ingresa el número interno (opcional)">
        </div>
        <div class="input-group">
            <label for="numero_externo">Número Externo</label>
            <input type="text" id="numero_externo" placeholder="Ingresa el número externo">
        </div>
        <div class="input-group">
            <label for="telefono">Número de Teléfono</label>
            <input type="tel" id="telefono" placeholder="Ingresa tu número de teléfono">
        </div>
        <div class="input-group">
            <label for="email">Correo Electrónico</label>
            <input type="email" id="email" placeholder="Ingresa tu correo electrónico">
        </div>
        <button type="button" onclick="nextTab('monto')">Siguiente</button>
    </div>

    <div id="monto" class="tab-content">
        <h2>Monto del Préstamo y Detalles de Empleo</h2>
        <div class="input-group">
            <label for="monto_prestamo">Monto del Préstamo</label>
            <select id="monto_prestamo">
                <option value="1000">$1,000</option>
                <option value="2000">$2,000</option>
                <option value="3000">$3,000</option>
                <option value="4000">$4,000</option>
                <option value="5000">$5,000</option>
            </select>
        </div>
        <div class="input-group">
            <label for="sector">Sector de Empleo</label>
            <select id="sector">
                <option value="publico">Sector Público</option>
                <option value="privado">Sector Privado</option>
            </select>
        </div>
        <div class="input-group">
            <label for="ingresos">Ingresos Mensuales</label>
            <input type="number" id="ingresos" placeholder="Ingresa tus ingresos mensuales">
        </div>
        <button type="button" onclick="previousTab('personal')">Anterior</button>
        <button type="button" onclick="nextTab('confirmacion')">Siguiente</button>
    </div>

    <div id="confirmacion" class="tab-content">
        <h2>Confirmación</h2>
        <p>Estamos procesando tu solicitud. Gracias por tu tiempo y preferencia.</p>
        <button type="button" onclick="previousTab('monto')">Regresar</button>
    </div>

    <div class="progress-bar">
        <div class="progress" id="progress"></div>
    </div>

    <script>
        const tabs = document.querySelectorAll('.tab');
        const tabContents = document.querySelectorAll('.tab-content');
        const progress = document.getElementById('progress');
        let currentTab = 0;

        function openTab(evt, tabName) {
            tabContents.forEach(tabContent => tabContent.classList.remove('active'));
            tabs.forEach(tab => tab.classList.remove('active'));
            document.getElementById(tabName).classList.add('active');
            evt.currentTarget.classList.add('active');
            updateProgressBar();
        }

        function nextTab(tabName) {
            openTab({ currentTarget: tabs[currentTab + 1] }, tabName);
            currentTab++;
        }

        function previousTab(tabName) {
            openTab({ currentTarget: tabs[currentTab - 1] }, tabName);
            currentTab--;
        }

        function updateProgressBar() {
            const stepPercentage = 100 / (tabs.length - 1) * currentTab;
            progress.style.width = `${stepPercentage}%`;
        }
    </script>
</body>
</html>

