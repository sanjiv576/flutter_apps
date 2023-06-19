const asyncHandler = require("../middleware/async");
const Batch = require("../models/batch");

// @desc    Get all batches
// @route   GET /api/v1/batches
// @access  Public

exports.getBatches = asyncHandler(async (req, res, next) => {
  try {
    const batch = await Batch.find({});
    res.status(200).json({
      success: true,
      count: batch.length,
      data: batch,
    });
  } catch (err) {
    res.status(400).json({ success: false });
  }
});

// @desc    Get single batch
// @route   GET /api/v1/batches/:id
// @access  Public

exports.getBatch = asyncHandler(async (req, res, next) => {
  const batch = await Batch.findById(req.params.id);
  if (!batch) {
    return res
      .status(404)
      .json({ message: "Batch not found with id of ${req.params.id}" });
  } else {
    res.status(200).json({
      success: true,
      data: batch,
    });
  }
});

// @desc    Create new batch
// @route   POST /api/v1/batches
// @access  Private

exports.createBatch = asyncHandler(async (req, res, next) => {
  try {
    const batch = await Batch.create(req.body);

    res.status(201).json({
      success: true,
      data: batch,
    });
  } catch (err) {
    res.status(400).json({ success: false });
  }
});

// @desc    Update batch
// @route   PUT /api/v1/batches/:id
// @access  Private

exports.updateBatch = asyncHandler(async (req, res, next) => {
  let batch = await Batch.findById(req.params.id);

  if (!batch) {
    return res
      .status(404)
      .json({ message: "Batch not found with id of ${req.params.id}" });
  }

  batch = await Batch.findByIdAndUpdate(req.params.id, req.body, {
    new: true,
    runValidators: true,
  });

  res.status(200).json({
    success: true,
    data: batch,
  });
});

// @desc    Delete batch
// @route   DELETE /api/v1/batches/:id
// @access  Private

exports.deleteBatch = asyncHandler(async (req, res, next) => {
  const batch = await Batch.findById(req.params.id);

  if (!batch) {
    return res
      .status(404)
      .json({ message: "Batch not found with id of ${req.params.id}" });
  }

  batch.remove();

  res.status(200).json({
    success: true,
    data: {},
  });
});
