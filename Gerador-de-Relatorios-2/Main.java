import java.util.*;
import java.io.IOException;


class Main {
  
  public static void main(String [] args) {
  
  	GeradorDeRelatorios gdr = new GeradorDeRelatorios(GeradorDeRelatorios.carregaArquivo("produtos.csv"), new QuickSort(), new ComparadorPrecoDesc(), new Todos());                              	
  			
    try{
  			gdr.geraRelatorio("saida.html");
  		}
  		catch(IOException e){
  			
  			e.printStackTrace();
  		}     
  
  }
	
}