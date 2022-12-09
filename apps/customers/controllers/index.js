

const get = (req,res) => {
    res.status(200).send("GET request to customers");
};

module.exports = {
    get
};