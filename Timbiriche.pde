/**
    Timbiriche
    
    Programa de ejemplo para jugar entre dos personas. Se le ha quitado
    el uso de Inteligencia Artificial, por ello el diseño interno es
    más complejo de lo necesario.
    
    Miguel Angel Norzagaray Cosío
    UABCS/DSC
*/

int n=5;          // Cantidad de puntitos por lado
int Ancho=3;
int Radio=10;
int TamTab=80;    // Separación del encabezado
int Tam; 

// Colores de Mano
color Rojo = #FF0000;
color RojoClaro = #FF7E7E;

// Colores de Tras
color Azul = #0000FF;
color AzulClaro = #807EFF;

color ColorLibre = 175;

int Turno=0;
int Mano=0;
int PuntosMano=0;
int PuntosTras=0;
boolean JugadorSigue=false;

Punto[][] Puntos;
Raya[][] RayasH, RayasV;
Box[][] Boxes;

ArrayList<Raya> Jugadas = new ArrayList();
int iJugadas;

void setup () 
{
    size (600,600);
    if ( n<3 )
        n=3;
    TamTab = 80;
    Tam = (min(width,height)-TamTab)/n;
    GenerarPuntosRayasBoxes(n);
    CrearAsociaciones();
    GenerarJugadas();
    textSize(20);
}

void draw() 
{
    background(200);
    strokeWeight(Ancho*2);
    PintarBoxes();
    PintarRayas();
    PintarPuntos();
    EscribirMarcador();
    if ( Jugadas.size() == 0 ) {
        textSize(30);
        text("Juego terminado", width/2-100,height-40);
        noLoop();
    }
}

void PintarBoxes()
{
    for (int i = 0; i < n-1; i++)
        for (int j = 0; j < n - 1; j++)
            Boxes[i][j].Dibujar();
}

void PintarRayas()
{
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n-1 ; j++)
            RayasH[i][j].Dibujar();
    
    for (int i = 0; i < n-1 ; i++)
        for (int j = 0; j < n ; j++)
            RayasV[i][j].Dibujar();
}

void PintarPuntos()
{
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            Puntos[i][j].Dibujar();
}

void EscribirMarcador()
{
    fill(Rojo);
    text("Mano: "+str(PuntosMano),70,40);
    fill(Azul);
    text("Tras: "+str(PuntosTras),width/2,40);
    noFill();
    stroke(0);
    strokeWeight(2);
    if ( Turno == Mano )
        rect(62,15,120,35);
    else
        rect(width/2-10,15,120,35);
}

// Si un click es sobre una raya, se marca
void mouseClicked() 
{    
    for (Raya R : Jugadas) 
        if ( R.MouseIn() ) {
            R.MarcarRaya();
            break;
        }
}

void CambiarTurno()
{
    Turno = 1-Turno;
}
