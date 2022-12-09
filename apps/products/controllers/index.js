

const get = (req,res) => {
    res.status(200).send("GET request to products");
};

module.exports = {
    get
};