import java.io.PrintWriter;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileNotFoundException;

import java.util.*;

//Classe que organiza todas as implementações para a realização da tarefa,
//gerar relatórios de produtos

public class GeradorDeRelatorios {

  private ArrayList<Produto> produtos;
  private AlgoritmosDeOrdenacao algoritmo;
  private Comparator<Produto> criterio;
  private CriterioFiltro filtro;

  public GeradorDeRelatorios(ArrayList<Produto> produtos, AlgoritmosDeOrdenacao algoritmo, Comparator<Produto> criterio,
      CriterioFiltro filtro) {

    this.produtos = new ArrayList<>();
    for (int i = 0; i < produtos.size(); i++) {
      this.produtos.add(produtos.get(i));
    }
    this.algoritmo = algoritmo;
    this.criterio = criterio;
    this.filtro = filtro;
  }

  private void ordena() {
    this.algoritmo.ordenar(this.produtos, criterio);
  }

  public void debug() {

    System.out.println("Gerando relatório para array contendo " + produtos.size() + " produto(s)");
    System.out.println("parametro filtro = '" + this.filtro.getNome() + "'");
  }

  public void geraRelatorio(String arquivoSaida) throws IOException {

    debug();

    ordena();

    PrintWriter out = new PrintWriter(arquivoSaida);

    out.println("<!DOCTYPE html><html>");
    out.println("<head><title>Relatorio de produtos</title></head>");
    out.println("<body>");
    out.println("Relatorio de Produtos:");
    out.println("<ul>");

    int count = 0;
    for (Produto p : produtos) {
      if (filtro.testar(p)) {
        out.print("<li>");
        out.print(p.formataParaImpressao());
        out.println("</li>");
        count = count + 1;
      }
    }

    out.println("</ul>");
    out.println(count + " produtos listados, de um total de " + produtos.size() + ".");
    out.println("</body>");
    out.println("</html>");

    out.close();
  }

  public static ArrayList<Produto> carregaProdutos() {
    ArrayList<Produto> produtos = new ArrayList<>();

    produtos.add(new ProdutoPadrao(1, "O Hobbit", "Livros", 2, 34.90));
    produtos.add(new ProdutoPadrao(2, "Notebook Core i7", "Informatica", 5, 1999.90));
    produtos.add(new ProdutoPadrao(3, "Resident Evil 4", "Games", 7, 79.90));
    produtos.add(new ProdutoPadrao(4, "iPhone", "Telefonia", 8, 4999.90));
    produtos.add(new ProdutoPadrao(5, "Calculo I", "Livros", 20, 55.00));
    produtos.add(new ProdutoPadrao(6, "Power Glove", "Games", 3, 499.90));
    produtos.add(new ProdutoPadrao(7, "Microsoft HoloLens", "Informatica", 1, 19900.00));
    produtos.add(new ProdutoPadrao(8, "OpenGL Programming Guide", "Livros", 4, 89.90));
    produtos.add(new ProdutoPadrao(9, "Vectrex", "Games", 1, 799.90));
    produtos.add(new ProdutoPadrao(10, "Carregador iPhone", "Telefonia", 15, 499.90));
    produtos.add(new ProdutoPadrao(11, "Introduction to Algorithms", "Livros", 7, 315.00));
    produtos.add(new ProdutoPadrao(12, "Daytona USA (Arcade)", "Games", 1, 12000.00));
    produtos.add(new ProdutoPadrao(13, "Neuromancer", "Livros", 5, 45.00));
    produtos.add(new ProdutoPadrao(14, "Nokia 3100", "Telefonia", 4, 249.99));
    produtos.add(new ProdutoPadrao(15, "Oculus Rift", "Games", 1, 3600.00));
    produtos.add(new ProdutoPadrao(16, "Trackball Logitech", "Informatica", 1, 250.00));
    produtos.add(new ProdutoPadrao(17, "After Burner II (Arcade)", "Games", 2, 8900.0));
    produtos.add(new ProdutoPadrao(18, "Assembly for Dummies", "Livros", 30, 129.90));
    produtos.add(new ProdutoPadrao(19, "iPhone (usado)", "Telefonia", 3, 3999.90));
    produtos.add(new ProdutoPadrao(20, "Game Programming Patterns", "Livros", 1, 299.90));
    produtos.add(new ProdutoPadrao(21, "Playstation 2", "Games", 10, 499.90));
    produtos.add(new ProdutoPadrao(22, "Carregador Nokia", "Telefonia", 14, 89.00));
    produtos.add(new ProdutoPadrao(23, "Placa Aceleradora Voodoo 2", "Informatica", 4, 189.00));
    produtos.add(new ProdutoPadrao(24, "Stunts", "Games", 3, 19.90));
    produtos.add(new ProdutoPadrao(25, "Carregador Generico", "Telefonia", 9, 30.00));
    produtos.add(new ProdutoPadrao(26, "Monitor VGA 14 polegadas", "Informatica", 2, 199.90));
    produtos.add(new ProdutoPadrao(27, "Nokia N-Gage", "Telefonia", 9, 699.00));
    produtos.add(
        new ProdutoPadrao(28, "Disquetes Maxell 5.25 polegadas (caixa com 10 unidades)", "Informatica", 23, 49.00));
    produtos.add(new ProdutoPadrao(29, "Alone in The Dark", "Games", 11, 59.00));
    produtos.add(new ProdutoPadrao(30, "The Art of Computer Programming Vol. 1", "Livros", 3, 240.00));
    produtos.add(new ProdutoPadrao(31, "The Art of Computer Programming Vol. 2", "Livros", 2, 200.00));
    produtos.add(new ProdutoPadrao(32, "The Art of Computer Programming Vol. 3", "Livros", 4, 270.00));

    return produtos;

  }

  public static ArrayList<Produto> carregaArquivo(String caminhoArquivo) {
    ArrayList<Produto> produtos = new ArrayList<>();   
    
    try{
      BufferedReader scanner = new BufferedReader(new FileReader(caminhoArquivo));
      String linha;

      linha = scanner.readLine();//ignorando o cabeçalho do arquivo
      
      while ((linha = scanner.readLine()) != null) {
        String[] campos = linha.split(", ");
        
        Produto produto = new ProdutoPadrao(
          Integer.parseInt(campos[0]),
          campos[1],
          campos[2],
          Integer.parseInt(campos[3]),
          Double.parseDouble(campos[4]));

          if(campos[5].equals("true"))
            produto = new Negrito(produto);
          if(campos[6].equals("true")){
            produto = new Italico(produto);
          }
          produto = new CorDoTexto(produto, campos[7]);
  
          produtos.add(produto);
      }

        
    }
      
    catch (FileNotFoundException e) {
      System.out.println("Arquivo não encontrado");
      e.printStackTrace();
    }

    catch(IOException e){
      System.out.println("IOException");
      e.printStackTrace();
    }
    
    return produtos;  
  }
}
