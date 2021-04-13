# CHUCK NORRIS FACTS
Hay que desarrollar un buscador de facts de Chuck Norris que se obtienen de la API https://api.chucknorris.io/

El buscador tendrá las siguientes características:

• No necesita login, es abierto.
• Se permitirá buscar por:

- Palabras.
- Categorías.
- De manera aleatoria.
- Los resultados se mostrarán paginados.
- Cada búsqueda junto con los resultados obtenidos se guardarán en base de datos.
- Existirá la opción de introducir una cuenta de email para que se envíen los resultados de la búsqueda.
- La aplicación estará disponible en castellano e inglés (los contenidos extraídos de la API no es necesario traducirlos, se pueden presentar en inglés).

La estructura y el diseño de la página y de los correos son completamente libres, al igual que el modelo de datos para guardar la información. Se puede añadir cualquier otra funcionalidad o mejora que se considere.

## Tech

El proyecto se ha desarrollado con Rails 6  y VueJS 2.6.11
Se ha dockerizado la app de Vuejs y la parte back en Ruby on Rails con Postgresql y Mailcatcher para la simulación de los emails.

## Docker

### BACK
Hacemos el build del proyecto
```sh
cd chucknorrisfacts-api-main
docker build -t rails-docker .
```
Una vez creada la imagen ejecutamos docker-compose

```sh
docker-compose -f docker-compose.yml up --build  
```

Nos montará las imagenes de postgresql y mailcatcher y nos ejecutará el proyecto en el puerto 3000, para acceder a mailcatcher entramos desde http://localhost:1080/

Se incluye una colleción de postman para probar la api. https://github.com/klomoli/chucknorrisfacts-api/blob/main/chucknorris.postman_collection.json

### FRONT VUEJS

Se ha utilizado VueJS 2 junto con Vuetify, para montar la imagen ejecutamos los siguientes comandos.

```sh
cd chucknorris
docker build -t my-app:dev .
docker run -v ${PWD}:/app -v /app/node_modules -p 8081:8080 --rm my-app:dev
```
Una vez terminado, entramos a http://localhost:8081/ y vemos el frontal que se comunica con nuestro back de facts

### API DESPLEGADA

##### Devuelve una frase aleatoria filtrado por categoría
```
/api/facts?random_category=animal
```
##### Devuelve frases que contengan ese término de búsqueda
```
/api/facts?search=trump
```

##### Devuelve una frase aleatoria
```
/api/facts?randomness=1
```

##### Devuelve búsquedas almacenadas en BD . Se requiere de los parámetros limit y offset
```
/api/searches/200/0
```

##### Devuelve búsquedas almacenadas en BD filtradas por categoría de búsqueda. Se requiere de los parámetros limit, offset y categoria a buscar.
```
/api/searches/5/0/random
```

##### Envía por email una búsqueda . Se requiere de los parámetros id de la búsqueda, ademas del email por form-data 
```
api/search/16/email
```

## License

MIT

**Free Software, Hell Yeah!**
