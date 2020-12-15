import psycopg2

def remove_customer_by_cpf(cpf):

    cpf_formatado = cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]

    connection = psycopg2.connect(
        host='zepalheta-postgres',
        database='zepalheta',
        user='postgres',
        password='qaninja'
    )

    query = "delete from public.customers where cpf = '{}';".format(cpf_formatado)

    cursor = connection.cursor()

    cursor.execute(query)

    connection.commit()

    cursor.close()
    connection.close()