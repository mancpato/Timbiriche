/*
    Clase Punto
    
    Son la estructura base del juego. No hay interacción con estos
    objetos para el usuario.
*/

class Punto {
    int x, y;
    int Radio;
  
    Punto (int _x, int _y, int _R) {
        x = _x;
        y = _y;
        Radio = _R; 
    }
    
    void Dibujar() {
        noStroke();
        fill(0);
        ellipse(x,y,Radio,Radio);
    }
}
