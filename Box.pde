/**
    Clase Box
    
    Sirve para representar los cuadros. Ganarlos es el objetivo
    del juego. Existen desde el inicio del juego, pero solo son 
    visibles cuando un jugador los cierra.
    
    No tienen interacción con el usuario.
*/

class Box {
    int LadosLibres;
    Raya N, S, W, E;
    color Color;
    boolean Cerrado;
    
    Box (Raya _N, Raya _S, Raya _W, Raya _E) {
        N = _N;
        S = _S;
        W = _W;
        E = _E;
        Cerrado = false;
        LadosLibres = 4;
    }
    
    void Dibujar () {
        if ( !Cerrado ) 
            return;
        noStroke();
        fill(Color);
        rect(W.Ini.x+Ancho, W.Ini.y+Ancho, Tam-Ancho, Tam-Ancho);
    }
    
    void Cerrar () {
        Cerrado = true;
        if ( Turno == Mano )
            PuntosMano++;
        else
            PuntosTras++;
        Color = Turno==Mano ? RojoClaro : AzulClaro;
    }  
}
