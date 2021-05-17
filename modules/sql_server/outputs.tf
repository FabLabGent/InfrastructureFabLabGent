output "sql_server_name" {
    value = azurerm_sql_server.sqls.name
}

output "sql_server_administrator_login" {
    value = azurerm_sql_server.sqls.administrator_login 
}

output "sql_server_administrator_login_password" {
    value = azurerm_sql_server.sqls.administrator_login_password
}