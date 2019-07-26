package generator;

/**
 * 项目常量
 * @author admin
 */
public final class CodeConstant {
    /** 项目基础包名称，根据自己公司的项目修改 */
    public static final String BASE_PACKAGE = "com.hn.horse";
    /** Model所在包 */
    public static final String MODEL_PACKAGE = BASE_PACKAGE + ".model.entity";
    /** Mapper所在包 */
    public static final String MAPPER_PACKAGE = BASE_PACKAGE + ".mapper";
    /** Service所在包 */
    public static final String SERVICE_PACKAGE = BASE_PACKAGE + ".service";
    /** ServiceImpl所在包 */
    public static final String SERVICE_IMPL_PACKAGE = SERVICE_PACKAGE + ".impl";
    /** Controller所在包 */
    public static final String CONTROLLER_PACKAGE = BASE_PACKAGE + ".web";
    /** Mapper插件基础接口的完全限定名 */
    public static final String MAPPER_INTERFACE_REFERENCE = "com.hn.horse.common.mapper.Mapper";
    /**
     *  ftl基础包名称，根据自己公司的项目修改
     */
    public static final String BASE_FTL = "com.hn.haoniu.manager";
}
