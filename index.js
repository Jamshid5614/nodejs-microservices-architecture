const proxy = require("express-http-proxy");
const express = require("express");
const config = require("./configs");
const app = express();
const dotenv = require("dotenv");

dotenv.config({ path: "./.env" });

app.use("/api/customers", proxy(config.customers_api, { memoizeHost: true }));
app.use("/api/admins", proxy(config.admins_api, { memoizeHost: true }));
app.use("/api/products", proxy(config.products_api, { memoizeHost: true }));

app.listen(process.env.PORT, () => {
  console.log("App is listening to the port", +process.env.PORT);
});
