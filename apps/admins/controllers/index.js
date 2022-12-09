

const get = (req,res) => {
    res.status(200).send("GET request to admins");
};

module.exports = {
    get
};