// Función para llenar los selects con los datos
const llenarCamposSelect = (id, datos) => {
    const campoSelect = document.getElementById(id)
    campoSelect.innerHTML = '<option value="">Seleccione una opción</option>' 
    // Itera en cada dato y lo asigna a los campos de tipo Option
    datos.forEach(item => {
        const campoOption = document.createElement('option')
        campoOption.value = item.id 
        campoOption.textContent = item.name
        campoOption.setAttribute('precio', item.precio) 
        campoSelect.appendChild(campoOption)
    })
}

// Función para obtener los datos del servidor y llenar los selects
const CargarDatos = async () => {
    const respuesta = await fetch('/data/getData')
    const data = await respuesta.json()

    // Llena los selects con los datos
    llenarCamposSelect('mesero', data.meseros.map(mesero => ({ id: mesero.Mes_ID, name: mesero.Mes_Nombre })))
    llenarCamposSelect('producto', data.productos.map(producto => ({ id: producto.Prod_ID, name: producto.Prod_Nombre, precio: producto.Prod_Precio })))
    llenarCamposSelect('tipoCliente', data.tiposCliente.map(tipoCliente => ({ id: tipoCliente.TiC_ID, name: tipoCliente.TiC_Tipo })))
    llenarCamposSelect('mesa', data.mesas.map(mesa => ({ id: mesa.Mesa_ID, name: mesa.Mesa_Nombre })))
}

// Cargar los datos al cargar la página y ejecuta las funciones correspondientes
document.addEventListener('DOMContentLoaded', () => {
    CargarDatos()

    const contenedorProductos = document.querySelector('.items')
    const botonAgregar = document.querySelector('.add-product-btn')
    const seleccionProducto = document.getElementById('producto')
    const botonRegistrarOrden = document.querySelector('.submit-order-btn')
    const campoOcultoProducto = document.getElementById('productos')

    // Array que va a contener productos seleccionados por el usuario
    let productos = [] 

    // Función para agregar el producto al carrito
    const agregarProducto = (event) => {
        // Prevenir el comportamiento por defecto del botón
        event.preventDefault() 

        // Obtiene el producto seleccionado
        const productoSeleccionado = seleccionProducto.options[seleccionProducto.selectedIndex]

        // Obtiene el ID del producto
        const productId = productoSeleccionado.value

        // Introduce los ID de los productos al Array previamente creado
        productos.push(productId)

        // Crear el nuevo contenedor del producto
        const contenedorProducto = document.createElement('div')
        const precioProducto = productoSeleccionado.getAttribute('precio')
        
        contenedorProducto.classList.add('item')
        contenedorProducto.innerHTML = `
            <div class="item-info">
                <p>${productoSeleccionado.textContent}</p>
            </div>
            <div class="item-price">$ ${precioProducto}</div>
            <button class="btn-remove"><ion-icon name="trash-outline"></ion-icon></button>
        `

        // Agrega el producto al contenedor del producto
        contenedorProductos.appendChild(contenedorProducto)

        // Limpia el selector de productos
        seleccionProducto.value = ""

        // Añade el eventos al botón eliminar que se encuentra dentro del contenedor del producto
        agregarEventoAContenedorProducto(contenedorProducto, productId)
    }

    // Función para añadir eventos a los botones de cada producto 
    const agregarEventoAContenedorProducto = (contenedorProducto, productId) => {
        const removeBtn = contenedorProducto.querySelector('.btn-remove')

        // Remueve el producto
        removeBtn.addEventListener('click', () => {
            contenedorProducto.remove()
            productos = productos.filter(id => id !== productId)
            actualizarCampoHidden() 
        })
    }

    // Función para actualizar el campo oculto con los IDs de los productos
    const actualizarCampoHidden = () => {
        // Convierte el array a una cadena separada por comas
        campoOcultoProducto.value = productos.join(',') 
    }

    // Evento click para el botón de agregar producto
    botonAgregar.addEventListener('click', agregarProducto)

    // Evento click para el botón de registrar la orden
    botonRegistrarOrden.addEventListener('click', () => {
        actualizarCampoHidden() 
    })
})
