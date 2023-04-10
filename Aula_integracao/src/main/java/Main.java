import DAO.UserDAO;
import Model.User;
public class Main {
    public static void main(String[] args) {

        UserDAO userDAO = new UserDAO();

        User user = new User("Matheus", "1414789");
        User user1 = new User("Pedro", "123465");

        // adicionando usuários na tebela do BD
        userDAO.insertUser(user);
        userDAO.insertUser(user1);

    }
}