// Función para llenar los selects con los datos
const populateSelect = (id, data) => {
    const select = document.getElementById(id);
    select.innerHTML = '<option value="">Seleccione...</option>'; 
    data.forEach(item => {
        const option = document.createElement('option');
        option.value = item.id; 
        option.textContent = item.name; 
        select.appendChild(option);
    });
};

const populateRadioButtons = (containerId, name, data) => {
    const container = document.getElementById(containerId);
    container.innerHTML = ''; 
    data.forEach(item => {

        // Crear la etiqueta para el radio button
        const label = document.createElement('label');
        label.htmlFor = `tipoCliente_${item.id}`;
        label.textContent = item.name; 

        // Crear el input tipo radio
        const radioInput = document.createElement('input');
        radioInput.type = 'radio';
        radioInput.value = item.id; 
        radioInput.name = name; 
        radioInput.id = `tipoCliente_${item.id}`; 

        // Agregar el input y la etiqueta al contenedor
        container.appendChild(radioInput);
        container.appendChild(label);
    });
};

// Función para obtener los datos del servidor y llenar los selects
const loadData = async () => {
    try {
        const response = await fetch('/data/getData');
        const data = await response.json();

        // Llenar los selects con los datos
        populateSelect('Mesero', data.meseros.map(m => ({ id: m.Mes_ID, name: m.Mes_Nombre })));
        populateSelect('Producto', data.productos.map(p => ({ id: p.Prod_ID, name: p.Prod_Nombre })));
        populateRadioButtons('tipo-cliente-container', 'tipoCliente', data.tipoCliente.map(t => ({ id: t.TiC_ID, name: t.TiC_Tipo })));
    } catch (error) {
        console.error('Error al cargar los datos:', error);
    }
};

// Cargar los datos al cargar la página
document.addEventListener('DOMContentLoaded', loadData);
