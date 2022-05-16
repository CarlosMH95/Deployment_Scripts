#!/usr/bin/bash
# Script para automatizacion de los deployments en minikube
# Requiere 4 parametros de entrada. 
# El primero es la ruta donde se encuentra el dockerfile.
# El siguiente es el nombre de la imagen.
# El siguiente es la direccion y nombre del configmap. 
# El ultimo parametro se refiere a la direccion y nombre del archivo de deployment.
echo 'Empieza el deployment'
echo
echo 'Creando Imagen Docker'
echo
cd $1
docker build -t $2 .
cd ..

echo 'Imagen Creada'
echo
echo 'Cargando imagen a Minikube'
echo
minikube image load $2

echo 'Imagen Cargada'
echo

echo 'Cargando Configmaps y Deployments'
echo
kubectl apply -f $3
kubectl apply -f $4
echo 'Fin.'