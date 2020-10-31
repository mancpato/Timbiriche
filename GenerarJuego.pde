/**
    Se crean los puntos, rayas y cuadros para comenzar a jugar.
    A cada raya se le asocian los dos cuadros que puede cerrar.
*/

void GenerarPuntosRayasBoxes(int n)
{
    int i,j;
    
    Puntos = new Punto [n][n];
    for ( i = 0; i < n; i++ ) 
        for ( j = 0; j < n; j++ )
            Puntos[i][j] = new Punto(i*Tam+TamTab, j*Tam+TamTab, Radio);

    RayasH = new Raya [n][n-1];
    for ( i = 0; i < n; i++ )
        for ( j = 0; j < n-1; j++ )
            RayasH[i][j] = new Raya (Puntos[i][j], Puntos[i][j+1], 0);
    RayasV = new Raya [n-1][n];
    for ( i = 0; i < n-1; i++ )
        for ( j = 0; j < n ; j++ )
            RayasV[i][j] = new Raya (Puntos[i][j], Puntos[i+1][j], 1);
    
    Boxes = new Box [n-1][n-1];
    for ( i = 0; i < n - 1; i++ )
        for ( j = 0; j < n - 1; j++ ) 
            Boxes[i][j] = new Box (RayasH[i][j], RayasH[i+1][j], 
                                   RayasV[i][j], RayasV[i][j+1]);
}

/*
    Cada raya puede cerrar uno o dos cuadros. Aquí se crean esas
    asociaciones.
    
    Al poner una raya, se revisan los cuadros para determinar si 
    se cierran o no.
*/
void CrearAsociaciones()
{
    int i,j;
    for ( i = 0; i < n; i++ )
        for ( j = 0; j < n-1; j++ ) {
            RayasH[i][j].B1i = i==0? -1 :i-1;
            RayasH[i][j].B1j = j;
            RayasH[i][j].B2i = i==n-1? -1 : i;
            RayasH[i][j].B2j = j;
        }

    for ( i = 0; i < n-1; i++ )
        for ( j = 0; j < n; j++ ) {
            RayasV[i][j].B1i = i;
            RayasV[i][j].B1j = j==0? -1 : j-1;
            RayasV[i][j].B2i = i;
            RayasV[i][j].B2j = j==n-1? -1 : j;
        }
}

void GenerarJugadas()
{
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n-1 ; j++)
            Jugadas.add(RayasH[i][j]);
    
    for (int i = 0; i < n-1 ; i++)
        for (int j = 0; j < n ; j++)
            Jugadas.add(RayasV[i][j]);
}
