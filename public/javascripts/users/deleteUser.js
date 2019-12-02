function deleteUserToDatabase(email, password) {
    let deleteUserQuery = "EXEC sp_deleteUser " + email + "," + password + ";";
}