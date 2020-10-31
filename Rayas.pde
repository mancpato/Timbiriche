/**
    Clase Raya
    
    Las rayas son los objetos con los que el usuario interactúa, 
    marcándolos.
    
    No es necesario ponerles colores, pero se ve bonito :-)
*/

class Raya {
    int D;    //  Horizontal=0, Vertical=1
    Punto Ini, Fin;
    int clickWidth;
    boolean Marcada;
    color Color;
    int B1i, B1j;
    int B2i, B2j;
    
    Raya (Punto _Ini, Punto _Fin, int _D) {
        D = _D;
        Ini = _Ini;
        Fin = _Fin;
        clickWidth = Ancho*2;
        Marcada = false;
        Color = ColorLibre;
    }
    
    void Dibujar () {
        if ( Marcada ) {
            stroke(Color);
            line (Ini.x, Ini.y, Fin.x, Fin.y);
            return;
        }
        if ( MouseIn() )
            stroke(Turno == Mano ? RojoClaro : AzulClaro );
        else
            stroke(Color);
        line (Ini.x, Ini.y, Fin.x, Fin.y);
    }
    
    // Si el mouse está sofucientemente cerca de la raya
    boolean MouseIn() {
        if ( mouseX > Ini.x+Radio/2 && mouseX < Fin.x-Radio/2 && 
             mouseY > Ini.y-clickWidth && mouseY < Ini.y+clickWidth )
            return true;
      
        if ( mouseX > Ini.x-clickWidth && mouseX <Ini.x+clickWidth && 
             mouseY > Ini.y+Radio/2 & mouseY < Fin.y-Radio/2)
            return true;  
        return false;
    }

    void MarcarRaya () {
        if ( Marcada )
            return;;
        Marcada = true;
        Color = Turno==Mano ? Rojo : Azul;
        JugadorSigue = false;
        Jugadas.remove(this);
        
        // Cada raya que se marca reduce los LadosLibres de sus cuadros
        // vecinos. Si LadosLibres llega a cero, el cuadro se ha cerrado
        // y el mismo jugador continua.
        
        // Horizontales
        if (  D==0 ) { //<>//
            if ( B1i > -1 ) {
                if ( Boxes[B1i][B1j].LadosLibres > 0)
                    Boxes[B1i][B1j].LadosLibres--;
                if ( Boxes[B1i][B1j].LadosLibres == 0 ) {
                    Boxes[B1i][B1j].Cerrar();
                    JugadorSigue = true;
                }
            }
            if ( B2i > -1 ) {
                if ( Boxes[B2i][B2j].LadosLibres > 0)
                    Boxes[B2i][B2j].LadosLibres--;
                if ( Boxes[B2i][B2j].LadosLibres == 0 ){
                    Boxes[B2i][B2j].Cerrar();
                    JugadorSigue = true;
                }
            }
        } 
        
        // Verticales
        if ( D==1 ) { //<>//
            if ( B1j > -1 ) {
                if ( Boxes[B1i][B1j].LadosLibres > 0 )
                    Boxes[B1i][B1j].LadosLibres--;
                if ( Boxes[B1i][B1j].LadosLibres == 0 ) {
                    Boxes[B1i][B1j].Cerrar();
                    JugadorSigue = true;
                }
            }
            if ( B2j > -1 ) {
                if ( Boxes[B2i][B2j].LadosLibres > 0)
                    Boxes[B2i][B2j].LadosLibres--;
                if ( Boxes[B2i][B2j].LadosLibres == 0 ){
                    Boxes[B2i][B2j].Cerrar();
                    JugadorSigue = true;
                }
            }
        }
        if ( !JugadorSigue )
            CambiarTurno();
    }
}
