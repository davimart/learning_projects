# main.py
from database_operations import *
from database_utils import *

def display_menu():
    print("\nMENU:")
    print("1. Cadastrar pessoas")
    print("2. Cadastrar eventos")
    print("3. Cadastrar edição")
    print("4. Cadastrar prêmios, nominações, premiações")
    print("5. Filmes")
    print("6. Gerar um gráfico, histograma, que apresente os dez atores (atrizes) com maior número de prêmios.")
    print("7. Gerar um gráfico, histograma, que apresente os 10 filmes mais premiados.")
    print("8. Gerar um gráfico, histograma, que apresente os 10 filmes com maior arrecadação")  # Corrected numbering
    print("9. Listar os atores (atrizes) nominados como melhor ator em todos os eventos existentes")  # Corrected numbering
    print("10. Dado um prêmio, indique quais foram os autores ou filmes nominados e premiados.")  # Corrected numbering
    print("0. Exit")


def main():
    connection = None
    cursor = None
    table_name = None
    print("Você pode conectar a uma database passando os dados de conexão ou só receber os comandos em texto")
    connect_to_db = input("Você quer conectar a database? (s/n): ").lower()

    if connect_to_db == 's':
        connection = connect_to_database()
        cursor = connection.cursor()

    while True:
        display_menu()

        choice = input("Escolha sua opção (0-10): ")

        if choice == "0":
            break
        elif choice == "1":
            query = cadastrar_pessoas()
        elif choice == "2":
            query = cadastrar_eventos()
        elif choice == "3":
            query = cadastrar_edicao()
        elif choice == "4":
            tipo_premio = input("Relacionado a melhor filme? (s/n):")
            if tipo_premio = 'n':
                query = cadastrar_premios()
            elif tipo_premio = 's':
                query = cadastrar_melhor_filme()
        elif choice == "5":
            query = cadastrar_filmes()
        elif choice == "6":
            query = gerar_grafico_atores()
        elif choice == "7":
            query = gerar_grafico_filmes()
        elif choice == "8":
            query = gerar_grafico_arrecadacao()
        elif choice == "9":
            query = listar_melhores_atores()
        elif choice == "10":
            evento_id = input("Enter the ID of the prize event: ")
            query = listar_premios_por_evento(evento_id)
        else:
            print("Invalid choice. Please try again.")

        if query is not None:
            print(f"Query result: {query}")
        
        if connect_to_db == 's':
            cursor.execute(query)
            cursor.connection.commit()

    if cursor:
        cursor.close()
    if connection:
        connection.close()

if __name__ == "__main__":
    main()
