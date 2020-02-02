function() {

var env = karate.env;

if (!env) { env = 'UATRS3'; karate.log('Environment not set =', karate.env); }

var config = {
    env: env,
    baseUrl: 'https://wudispatcher-uatrs3.westernunion.com',
    retry : { count: 3, interval: 90000 },
  }

  if(env == 'PARTNER')
  {
  config.baseUrl = 'https://partners-sandbox.westernunion.com';
  //https://partners-sandbox.westernunion.com
  //https://wudispatcher-qa11.qawesternunion.com
  //https://wudispatcher-uatci4.westernunion.com
  }
  else if (env == 'UATRS2') {
          config.baseUrl = 'https://wudispatcher-uatrs2.westernunion.com';
  }
  else if (env == 'UATRS3') {
        config.baseUrl = 'https://wudispatcher-uatrs3.westernunion.com';
  }
  else if (env == 'UATRS4') {
            config.baseUrl = 'https://wudispatcher-uatrs4.westernunion.com';
  }
  else if (env == 'PRODCI') {
              config.baseUrl = 'https://wudispatcherci.westernunion.com';
  }
  else if (env == 'PRODRS') {
                config.baseUrl = 'https://wudispatcherrs.westernunion.com';
   }
   else if (env == 'WU') {
                   config.baseUrl = 'https://www.westernunion.com';
      }

   karate.log('karate.env =', karate.env);
   karate.log('config.baseUrl =', config.baseUrl);
   return config;

}