{
  webserver = { config, pkgs, ... }: {
    deployment = {
      targetEnv = "virtualbox";
      virtualbox = {
        memorySize = 512;
        vcpu = 1;
        headless = true;
      };
    };
  };
}
