final createTable = '''
CREATE TABLE contact(
id INT NOT NULL PRIMARY KEY,
nome VARCHAR(200) NOT NULL,
telefone CHAR(16) NOT NULL
email VARCHAR(150) NOT NULL,
url_avatar VARCHAR(300) NOT NULL
)
''';

final insert1 = '''  
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Pietro','(11)9 9956-3621','pietro@email.com','https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png')
''';

final insert2 = '''  
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Maite','(11)9 9953-3333','maite@email.com','https://cdn.pixabay.com/photo/2021/07/08/07/23/child-6396103_960_720.png')
''';

final insert3 = '''  
INSERT INTO contact(nome,telefone,email,url_avatar)
VALUES('Hortencia','(11)9 9666-6666','hortencia@email.com','https://cdn.pixabay.com/photo/2021/07/11/07/12/woman-6403071_960_720.png')
''';
