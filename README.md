# Deploy no Railway (GitHub)

Este repositório contém o conteúdo do `wp-content` (plugins, tema, uploads etc.).
O deploy no Railway é feito com `Dockerfile`, usando a imagem oficial do WordPress.

## 1) Subir para o GitHub

```bash
git add .
git commit -m "Configura deploy WordPress no Railway"
git push
```

## 2) Criar projeto no Railway

1. Acesse Railway e clique em **New Project**.
2. Escolha **Deploy from GitHub repo**.
3. Selecione este repositório.

O Railway vai detectar o `Dockerfile` automaticamente.

## 3) Adicionar banco MySQL

No mesmo projeto, adicione o serviço de **MySQL** no Railway.

## 4) Variáveis de ambiente (serviço WordPress)

Configure estas variáveis no serviço da aplicação:

- `WORDPRESS_DB_HOST`
- `WORDPRESS_DB_USER`
- `WORDPRESS_DB_PASSWORD`
- `WORDPRESS_DB_NAME`

Opcional:

- `WORDPRESS_TABLE_PREFIX` (ex.: `wp_`)
- `WORDPRESS_DEBUG` (`1` para ligado, `0` para desligado)

## 5) Importar o banco

Importe o arquivo `database.sql` no MySQL do Railway (via cliente MySQL).

## 6) Ajustar URL do site no WordPress

Após subir, ajuste `siteurl` e `home` para a URL pública do Railway:

```sql
UPDATE wp_options SET option_value = 'https://SEU_DOMINIO.up.railway.app' WHERE option_name IN ('siteurl', 'home');
```

Se usar domínio customizado, substitua pela URL final.