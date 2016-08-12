accessing - private
segmentSize

	"El tamaño del segmento está basado en pruebas usando Fuel para serializar razas y profesiones.
Al probar serializar un base64 entero se cerraba la imagen (General Protection Fault?).
Se decidió partirla en segmentos para luego recominarlos en memoria.
Haciendo pruebas se observó que con segmentos de hasta 2048 caracteres funciona sin problemas.
En cuanto se usan segmentos de 2049, sea para imágenes de todas las profesiones o razas, se rompe.
Esto ocurre en cuanto al menos 2 profesiones/razas tienen una imagen base64 internamente.
Se decide dejar en 512 para dar lugar a futuros cambios inesperados en Fuel."

	^ 512