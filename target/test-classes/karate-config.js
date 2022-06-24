function fn() {
  var env = karate.env;
  karate.log('karate.env system property was:', env);
    karate.configure('retry',{ count:10, interval:2000});
  if (!env) {
    env = 'uat';
  }
  var config = {
    env: env,
        Entorno: 'UAT',
        host: 'https://eu2-ibk-apm-uat-ext-001.azure-api.net',


  }
  if (env == 'STG') {
    config.Entorno='STG';
    config.host='https://petstore.swagger.io';


  } else if (env == 'uat') {
        config.Entorno= 'UAT';
        config.host= 'https://petstore.swagger.io';

  }

  return config;
}