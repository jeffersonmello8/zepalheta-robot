import psycopg2

def exec_query_on_database(query):
    connection = psycopg2.connect(
        host='zepalheta-postgres',
        database='zepalheta',
        user='postgres',
        password='qaninja'
    )

    cursor = connection.cursor()

    cursor.execute(query)

    connection.commit()

    cursor.close()
    connection.close()

def format_cpf(cpf):
    return cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]

def insert_customer(name, cpf, address, phone):
    cpf_formatado = format_cpf(cpf)
    
    query =  "insert into public.customers(name, cpf, address, phone_number) "\
                "values ('{}', '{}', '{}', '{}');".format(name, cpf_formatado, address, phone)
    print(query)
    
    exec_query_on_database(query)

def remove_customer_by_cpf(cpf):
    cpf_formatado = format_cpf(cpf)

    query = "delete from public.customers where cpf = '{}';".format(cpf_formatado)
    print(query)

    exec_query_on_database(query)
