const mongoose = require("mongoose");

const batchSchema = new mongoose.Schema({
  batchName: {
    type: String,
    required: [true, "Please add a batch name"],
    unique: true,
    trim: true,
    maxlength: [20, "Batch name can not be more than 20 characters"],
  },
});

module.exports = mongoose.model("Batch", batchSchema);
