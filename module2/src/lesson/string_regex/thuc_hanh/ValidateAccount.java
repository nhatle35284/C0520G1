//package lesson.string_regex.thuc_hanh;
//
//import java.util.regex.Matcher;
//import java.util.regex.Pattern;
//
//public class ValidateAccount {
//    private static final String ACCOUNT_REGEX = "^[_a-z0-9]{6,}$";
//    public static void main(String[] args) {
//         String[] validAccount = new String[] { "123abc_", "_abc123", "______", "123456","abcdefgh" };
//         String[] invalidAccount = new String[] { ".@", "12345", "1234_", "abcde" };
//
//        ValidateAccount accountExample = new ValidateAccount();
//        Pattern pattern = Pattern.compile(ACCOUNT_REGEX);
//        String matcher = pattern.matcher(validAccount);
//            for (String account : validAccount) {
//                boolean isvalid = accountExample.;
//                System.out.println("Account is " + account +" is valid: "+ isvalid);
//            }
//            for (String account : invalidAccount) {
//                boolean isvalid = accountExample.validate(account);
//                System.out.println("Account is " + account +" is valid: "+ isvalid);
//            }
//        }
//}
//}
