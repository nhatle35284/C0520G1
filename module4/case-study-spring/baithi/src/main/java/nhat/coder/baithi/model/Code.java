package nhat.coder.baithi.model;

public class Code {
    public static String setUpCode(Product product){
        String code = null;
        Long id = product.getProductId();
        if (id<10){
            code = "SP-000"+id;
        }else if (id<100){
            code = "SP-00"+id;
        }else if (id<1000){
            code = "SP-0"+id;
        }else if (id<10000){
            code = "SP-"+id;
        }
        return code;
    }
}
