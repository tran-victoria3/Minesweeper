import de.bezier.guido.*;
private final int NUM_ROWS = 20;
private final int NUM_COLS = 20;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new MSButton(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    bombs = new ArrayList <MSButton>();
    //declare and initialize buttons
    setBombs();
    
    for(int i = 0; i < NUM_ROWS.length; i++){
        for(int j = 0; j < NUM_COL.length; j++){
            buttons = new MSButton[NUM_ROWS][NUM_COLS];    
        }
    }

}
public void setBombs()
{
    if(!(bombs.contains(buttons[rows][cols]))){
       bombs.add(buttons[rows][cols]);
    }
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    if(){
        return true;
    }
    else{
        return false;        
    }

}
public void displayLosingMessage()
{  
   text(150,150, "you lost!", 10);
}

public void displayWinningMessage()
{
    text(150,150, "you win", 10);
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        //your code here
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
        else if( clicked && bombs.contains(this) ) 
            fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int rows, int cols)
    {
        if((rows < NUM_ROWS) && (cols < NUM_COLS) ){
             return true;
        }
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        if(isValid(rows,cols) == true){
           if(bombs.contains(buttons[row][col])
              || bombs.contains(buttons[row+1][col]) || bombs.contains(buttons[row][col+1])|| 
                bombs.contains(buttons[row+1][col+1]) || bombs.contains(buttons[row][col+1]) ||
                    bombs.contains(buttons[row+1][col+1]) || bombs.contains(buttons[row-1][col]) ||
                        bombs.contains(buttons[row-1][col-1]) || bombs.contains(buttons[row][col-1]){
              numBombs++;
           }

        }
        return numBombs;
    }
}





