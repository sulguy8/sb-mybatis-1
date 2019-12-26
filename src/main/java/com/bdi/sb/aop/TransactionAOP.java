package com.bdi.sb.aop;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.interceptor.DefaultTransactionAttribute;
import org.springframework.transaction.interceptor.RollbackRuleAttribute;
import org.springframework.transaction.interceptor.RuleBasedTransactionAttribute;
import org.springframework.transaction.interceptor.TransactionInterceptor;

import lombok.extern.slf4j.Slf4j;

@Configuration
@EnableAspectJAutoProxy
@EnableTransactionManagement
@Slf4j
public class TransactionAOP {
	@Resource
	private DataSourceTransactionManager dstm;
	@Bean
	@ConfigurationProperties(prefix="spring.datasource.hikari")
	public DataSource getDS() {
		return DataSourceBuilder.create().build(); 
	}	
	@Bean // 요거를 쓰면 내가 직접만든 매서드(@Resource,@Service,@Repository등등..)가 아니더라도 자동으로 메모리 생성해줌.
	public DataSourceTransactionManager txManager() { // 얘한테 트랜젝션 시키는것
		return new DataSourceTransactionManager(getDS());
	}
	@Bean
	public TransactionInterceptor txInterceptor() {		
		List<RollbackRuleAttribute> rollbackRules = new ArrayList<>();
		rollbackRules.add(new RollbackRuleAttribute(Exception.class)); // 이셉션이 뜰때마다 리스트에 추가하겠다.
		DefaultTransactionAttribute readOnly = new DefaultTransactionAttribute(TransactionDefinition.PROPAGATION_REQUIRED);
		readOnly.setReadOnly(true); 
		readOnly.setTimeout(30); // 읽을때 전화를 붙들고 있는시간
		RuleBasedTransactionAttribute update = new RuleBasedTransactionAttribute(TransactionDefinition.PROPAGATION_REQUIRED, rollbackRules); // 이셉션 발생하면 rollbackRules가 해결함. 
		update.setTimeout(30); // 롤백할때 전화를 붙들고 있는 시간.
		
		Properties prop = new Properties();
		prop.setProperty("select*",readOnly.toString());
		prop.setProperty("find*",readOnly.toString());
		prop.setProperty("get*",readOnly.toString());
		prop.setProperty("search*",readOnly.toString());
		prop.setProperty("count*",readOnly.toString());
		prop.setProperty("*",update.toString());
		
		TransactionInterceptor txInterceptor = new TransactionInterceptor();
		txInterceptor.setTransactionAttributes(prop);
		txInterceptor.setTransactionManager(dstm);
		
		return txInterceptor;
	}
	
	@Bean
	public Advisor txAdvisor() {
		AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
		pointcut.setExpression("execution(* com.bdi.sb.service..*ServiceImpl.*(..))"); // ~~~ 서비스impl로 끝나면서 어떤 메서드가 와도 상관없고 어떤 파라미터도 상관없다.
		return new DefaultPointcutAdvisor(pointcut, txInterceptor());
	}
	
}
