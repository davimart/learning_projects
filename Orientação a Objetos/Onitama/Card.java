import java.util.Random;
import java.util.ArrayList;

/**
 * Classe que contém informações das cartas
 */
public class Card {
  private String nome;
  private Color color;
  private Position positions[];
    /**
     * Construtor que define os principais atributos de uma carta
     * @param name Nome da carta
     * @param color Cor da carta
     * @param positions Todas as posições relativas de movimento
     */
    public Card(String name, Color color, Position[] positions) {
      this.nome = name;
      this.color = color;
      this.positions = positions;
    }

    /**
     * Método que devolve o nome da carta
     * @return String que contém o nome da carta
     */
    public String getName() {
        return this.nome;
    }

    /**
     * Método que devolve a cor da carta
     * @return Enum Color que contém a cor da carta
     */
    public Color getColor() {
        return this.color;
    }

    /**
     * Método que devolve todas as possíveis posições relativas de movimento.
     * A posição atual da peça é o ponto de origem (0,0). Uma carta possui as possíveis posições de movimento em relação ao ponto de origem.
     * @return Um array de Position contendo todas as possíveis posições de movimento em relação ao ponto de origem
     */
    public Position[] getPositions() {
        return this.positions;
    }

    /**
     * Método que cria todas as cartas do jogo, embaralha-as e devolve as 5 que serão utilizadas na partida.
     * @return Vetor de cartas com todas as cartas do jogo
     */
  
    public static Card[] createCards() {
      Card[] game_deck = new Card[5];
      Card[] full_deck = new Card[8];
      ArrayList<Position> positions = new ArrayList<>();
      
      //Criando as cartas
      //Tiger
      positions.add(new Position(1,0));
      positions.add(new Position(-2,0));
      full_deck[0] = new Card("Tiger",Color.BLUE,positions.toArray(new Position[positions.size()]));
      positions.clear();
  
      //Dragon
      positions.add(new Position(-1,-2));
      positions.add(new Position(1,-1));
      positions.add(new Position(1,1));
      positions.add(new Position(-1,2));
      full_deck[1] = new Card("Dragon",Color.RED,positions.toArray(new Position[positions.size()]));
      positions.clear();

      //Frog
      positions.add(new Position(0,-2));
      positions.add(new Position(-1,-1));
      positions.add(new Position(1,1));
      full_deck[2] = new Card("Frog",Color.RED,positions.toArray(new Position[positions.size()]));
      positions.clear();

      //Rabbit
      positions.add(new Position(0,2));
      positions.add(new Position(-1,1));
      positions.add(new Position(1,-1));
      full_deck[3] = new Card("Rabbit",Color.BLUE,positions.toArray(new Position[positions.size()]));
      positions.clear();  
  
      //Crab
      positions.add(new Position(0,-2));
      positions.add(new Position(-1,0));
      positions.add(new Position(0,2));
      full_deck[4] = new Card("Crab",Color.BLUE,positions.toArray(new Position[positions.size()]));
      positions.clear();
  
      //Elephant
      positions.add(new Position(-1,-1));
      positions.add(new Position(0,-1));
      positions.add(new Position(0,1));
      positions.add(new Position(-1,1));
      full_deck[5] = new Card("Elephant",Color.RED,positions.toArray(new Position[positions.size()]));
      positions.clear();
  
      //Goose
      positions.add(new Position(-1,-1));
      positions.add(new Position(0,-1));
      positions.add(new Position(0,1));
      positions.add(new Position(1,1));
      full_deck[6] = new Card("Goose",Color.BLUE,positions.toArray(new Position[positions.size()]));
      positions.clear();
  
      //Rooster
      positions.add(new Position(-1,1));
      positions.add(new Position(0,1));
      positions.add(new Position(0,-1));
      positions.add(new Position(1,-1));
      full_deck[7] = new Card("Rooster",Color.RED,positions.toArray(new Position[positions.size()]));
      positions.clear();

      //Embaralhando
      ArrayList<Integer> shuffle = new ArrayList<>();
      
      int i= 0;
      while (shuffle.size() < 5){
        Random random = new Random();
        int aux = random.nextInt(8);
        if (!shuffle.contains(aux)) {
          shuffle.add(aux);
          game_deck[i]=full_deck[aux];
          i++;
        }        
      }
      
      return game_deck;
    }}
